/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package progress;

/**
 *
 * @author HOANG DUNG
 */
public class ProgressDTO {
    private int progressID;
    private int learningCourseID;
    private int videoID;
    private int isFinished;

    public ProgressDTO() {
    }

    public ProgressDTO(int progressID, int learningCourseID, int videoID, int isFinished) {
        this.progressID = progressID;
        this.learningCourseID = learningCourseID;
        this.videoID = videoID;
        this.isFinished = isFinished;
    }

    public int getProgressID() {
        return progressID;
    }

    public void setProgressID(int progressID) {
        this.progressID = progressID;
    }

    public int getLearningCourseID() {
        return learningCourseID;
    }

    public void setLearningCourseID(int learningCourseID) {
        this.learningCourseID = learningCourseID;
    }

    public int getVideoID() {
        return videoID;
    }

    public void setVideoID(int videoID) {
        this.videoID = videoID;
    }

    public int getIsFinished() {
        return isFinished;
    }

    public void setIsFinished(int isFinished) {
        this.isFinished = isFinished;
    }
    
    
}
