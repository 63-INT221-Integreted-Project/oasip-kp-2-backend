package sit.int221.bookingproj.entities;

import javax.persistence.*;
import java.time.Instant;

@Entity
@Table(name = "event")
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "eventId")
    private Integer eventId;

    @Column(name = "bookingName", nullable = false, length = 100)
    private String bookingName;
    @Column(name = "bookingEmail", nullable = false)
    private String bookingEmail;

    @Column(name = "eventStartTime", nullable = false)
    private Instant eventStartTime;

    @Column(name = "eventDuration", nullable = false)
    private Integer eventDuration;

    @Column(name = "eventNotes", length = 500, nullable = true)
    private String eventNotes;

    @ManyToOne(fetch = FetchType.EAGER, optional = true )
    @JoinColumn(name = "eventCategoryId", nullable = true, referencedColumnName = "eventCategoryId")
    private EventCategory eventCategory;

    @OneToOne
    @JoinColumn(name = "fileId" , nullable = true, referencedColumnName = "fileId")
    private File file;


    public Integer getEventDuration() {
        return eventDuration;
    }

    public void setEventDuration(Integer eventDuration) {
        this.eventDuration = eventDuration;
    }

    public String getEventNotes() {
        return eventNotes;
    }

    public void setEventNotes(String eventNotes) {
        this.eventNotes = eventNotes;
    }

    public Instant getEventStartTime() {
        return eventStartTime;
    }

    public void setEventStartTime(Instant eventStartTime) {
        this.eventStartTime = eventStartTime;
    }

    public EventCategory getEventCategory() {
        return eventCategory;
    }

    public void setEventCategory(EventCategory eventCategory) {
        this.eventCategory = eventCategory;
    }

    public String getBookingName() {
        return bookingName;
    }

    public void setBookingName(String eventBookingName) {
        this.bookingName= eventBookingName;
    }

    public String getBookingEmail() {
        return bookingEmail;
    }

    public void setBookingEmail(String eventBookingEmail) {
        this.bookingEmail = eventBookingEmail;
    }

    public Integer getEventId() {
        return eventId;
    }

    public void setEventId(Integer id) {
        this.eventId = id;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }
}