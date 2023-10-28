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
public class LessonDTO {
    private int lessonID;
    private String title;
    private String description;
    private int moduleID;

    public LessonDTO() {
    }

    public LessonDTO(int lessonID, String title, String description, int videoID) {
        this.lessonID = lessonID;
        this.title = title;
        this.description = description;
        this.moduleID = moduleID;
    }

    public int getLessonID() {
        return lessonID;
    }

    public void setLessonID(int lessonID) {
        this.lessonID = lessonID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getModuleID() {
        return moduleID;
    }

    public void setModuleID(int moduleID) {
        this.moduleID = moduleID;
    }
  
    
}
