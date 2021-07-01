package me.ele.mess;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.CONSTRUCTOR;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.PACKAGE;
import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.CLASS;

/**
 * 
 * @version 1.0
 * @author Administrator
 * @date 2021/6/21 10:43
 */
@Retention(CLASS)
@Target({PACKAGE,TYPE,ANNOTATION_TYPE,METHOD})
public @interface KeepMethod {
}
