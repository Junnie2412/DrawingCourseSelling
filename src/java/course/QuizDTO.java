
package course;

public class QuizDTO {
    private int quizID;
    private String title;
    private int lessonID;

    public QuizDTO() {
    }

    public QuizDTO(int quizID, String title, int lessonID) {
        this.quizID = quizID;
        this.title = title;
        this.lessonID = lessonID;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
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
