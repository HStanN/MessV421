package me.ele.mess

public class MessExtension {
    Set<String> ignoreProguardComponents = new HashSet<>()
    Iterable<String> whiteList = []

    void ignoreProguard(String component) {
        ignoreProguardComponents.add(component)
    }
}
