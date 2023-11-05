package course;

public class BillDTO {
    private int orderDetailID;
    private float price;
    private int quantity;
    private String courseId, courseName, fullName;

    public BillDTO() {
    }

    public BillDTO(int orderDetailID, float price, int quantity, String courseId, String courseName, String fullName) {
        this.orderDetailID = orderDetailID;
        this.price = price;
        this.quantity = quantity;
        this.courseId = courseId;
        this.courseName = courseName;
        this.fullName = fullName;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    
}
