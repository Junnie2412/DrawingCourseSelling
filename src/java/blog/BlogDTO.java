
package blog;

import java.sql.Date;

/**
 *
 * @author TienToan
 */
public class BlogDTO {
    private int postID;
    private String image;
    private String title;
    private String content;
    private Date dateCreate;
    private boolean isApproved;
    private String accountID;

    public BlogDTO() {
    }

    public BlogDTO(int postID, String image, String title, String content, Date dateCreate, boolean isApproved, String accountID) {
        this.postID = postID;
        this.image = image;
        this.title = title;
        this.content = content;
        this.dateCreate = dateCreate;
        this.isApproved = isApproved;
        this.accountID = accountID;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public boolean isIsApproved() {
        return isApproved;
    }

    public void setIsApproved(boolean isApproved) {
        this.isApproved = isApproved;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }
    
}
