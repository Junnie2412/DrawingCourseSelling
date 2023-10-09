/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package course;

import java.time.LocalTime;

/**
 *
 * @author HOANG DUNG
 */
public class VideoDTO {
    private int videoID;
    private String content;
    private LocalTime time;
    private boolean isActive;

    public VideoDTO() {
    }

    public VideoDTO(int videoID, String content, LocalTime time, boolean isActive) {
        this.videoID = videoID;
        this.content = content;
        this.time = time;
        this.isActive = isActive;
    }

    public int getVideoID() {
        return videoID;
    }

    public void setVideoID(int videoID) {
        this.videoID = videoID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }
    
}
