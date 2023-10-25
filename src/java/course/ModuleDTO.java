/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package course;

/**
 *
 * @author HOANG DUNG
 */
public class ModuleDTO {
    private int moduleID;
    private String title;
    private int lessonID;

    public ModuleDTO() {
    }

    public ModuleDTO(int moduleID, String title, int lessonID) {
        this.moduleID = moduleID;
        this.title = title;
        this.lessonID = lessonID;
    }
    public ModuleDTO(int moduleID, String title) {
        this.moduleID = moduleID;
        this.title = title;
    }


    public int getModuleID() {
        return moduleID;
    }

    public void setModuleID(int moduleID) {
        this.moduleID = moduleID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getLessonID() {
        return lessonID;
    }

    public void setLessonID(int lessonID) {
        this.lessonID = lessonID;
    }
}
