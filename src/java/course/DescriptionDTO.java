/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package course;

/**
 *
 * @author PC
 */
public class DescriptionDTO{
    private int descriptionID;
    private String content;
    private String target;
    private String image;
    private String type;
    private String level;
    
    public DescriptionDTO(){
        
    }
        
    public DescriptionDTO(int descriptionID, String content, String target, String image, String type, String level) {
        this.descriptionID = descriptionID;
        this.content = content;
        this.target = target;
        this.image = image;
        this.type = type;
        this.level = level;
    }

    public int getDescriptionID() {
        return descriptionID;
    }

    public void setDescriptionID(int descriptionID) {
        this.descriptionID = descriptionID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }
}

