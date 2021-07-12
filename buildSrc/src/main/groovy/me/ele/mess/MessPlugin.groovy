package me.ele.mess

import com.android.build.gradle.api.ApplicationVariant
import com.android.build.gradle.api.BaseVariantOutput
import com.android.build.gradle.tasks.ProcessAndroidResources
import com.android.builder.model.SourceProvider
import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.api.Task
import org.gradle.api.file.FileCollection
import org.gradle.api.tasks.SourceSet

import java.lang.reflect.Field

class MessPlugin implements Plugin<Project> {

    static final String TAG = "MessPlugin"

    @Override
    void apply(Project project) {
        MessExtension ext = project.extensions.create("mess", MessExtension.class)
        project.afterEvaluate {
            project.plugins.withId('com.android.application') {
                project.android.applicationVariants.all { ApplicationVariant variant ->

                    variant.outputs.each { BaseVariantOutput output ->
                        Util.LOG_PATH = "${project.buildDir.absolutePath}/outputs/logs/${Util.LOG_FINE_NAME}"
                        Util.log TAG, "MessPlugin Log Path " + Util.LOG_PATH
                        File messProguardFile = new File(Util.LOG_PATH)
                        if (messProguardFile.exists()) {
                            messProguardFile.delete()
                        }
                        String taskName = "minify${variant.name.capitalize()}WithR8"
                        def proguardTask = project.tasks.findByName(taskName)
                        if (!proguardTask) {
                            Util.log TAG, "MessPlugin Cannot find Task " + taskName
                            return
                        }
                        proguardTask.outputs.upToDateWhen { false }

                        def shrinkResForTask = project.tasks.findByName("shrink${variant.name.capitalize()}Res")
                        if (!shrinkResForTask) {
                            Util.log TAG, "MessPlugin Cannot find shrinkResForTask"
                        }
                        boolean hasProguardExecuted = false

                        boolean hasProcessResourcesExecuted = false
                        output.getProcessResourcesProvider().get().doLast {
                            if (hasProcessResourcesExecuted) {
                                return
                            }
                            hasProcessResourcesExecuted = true
                            def rulesPath = "${project.buildDir.absolutePath}/intermediates/aapt_proguard_file/${variant.name}/aapt_rules.txt"
                            def rulesPathCopy = "${project.buildDir.absolutePath}/intermediates/aapt_proguard_file/${variant.name}/aapt_rules_copy.txt"
                            Util.log TAG, "MessPlugin rulesPath" + rulesPath
                            File aaptRules = new File(rulesPath)
                            File aaptRulesCopy = new File(rulesPathCopy)
                            aaptRules.renameTo(aaptRulesCopy)
                            aaptRules.createNewFile()
                            aaptRules << "\n"
//                            Util.log TAG, "new file text = " + aaptRules.text

                            // adjust aaptRules
                            for (String line : aaptRulesCopy.readLines()) {
//                                Util.log TAG, "line: " + line
                                if (line.startsWith("-keep")) {
                                    // -keep class ; len = 12
                                    String tmpLine = line.substring(12, line.length())
                                    for (String white : ext.whiteList) {
                                        if (tmpLine.startsWith(white)) {
                                            Util.log TAG, "add keep class " + line
                                            aaptRules.append(line + "\n")
                                            break
                                        }
                                    }
                                }
                            }
                            Util.log TAG, ""
                            Util.log TAG, "keep aaptRules text = " + aaptRules.text
                            Util.log TAG, ""
                        }

                        RewriteComponentTask rewriteTask = project.tasks.create(name: "rewriteComponentFor${variant.name.capitalize()}",
                                type: RewriteComponentTask
                        ) {
                            applicationVariant = variant
                            whiteList = ext.whiteList
                            variantOutput = output
                        }

                        proguardTask.finalizedBy rewriteTask
                        proguardTask.doFirst {
                            Util.log TAG, "start ignore proguard components"
                            ext.ignoreProguardComponents.each { String component ->
                                Util.hideProguardTxt(project, component)
                            }
                        }

                        proguardTask.doLast {
                            hasProguardExecuted = true
                            Util.log TAG, "proguard finish, ready to execute rewrite"
//                            rewriteTask.rewrite()
                        }

                        proguardTask.doLast {
                            ext.ignoreProguardComponents.each { String component ->
                                Util.recoverProguardTxt(project, component)
                            }
                        }

//                        rewriteTask.finalizedBy processAndroidResourcesTask

                        if (shrinkResForTask) {
//                            Util.log TAG, "ready shrinkResForTask"
                            shrinkResForTask.dependsOn rewriteTask
                            shrinkResForTask.doFirst {
                                if (hasProguardExecuted) {
                                    return
                                }
                                Util.log TAG, "shrinkResForTask start, ready to execute rewrite"
//                                RewriteComponentTask rewriteTask1 = project.tasks.create(name: "rewriteComponentFor${variant.name.capitalize()}_1",
//                                        type: RewriteComponentTask){
//                                    applicationVariant = variant
//                                    variantOutput = output
//                                }
//                                rewriteTask1.rewrite()
                            }
                        }
                    }
                }
            }
        }
    }
}
