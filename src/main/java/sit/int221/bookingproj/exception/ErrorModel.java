package sit.int221.bookingproj.exception;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.http.HttpStatus;

import java.time.LocalDateTime;
import java.util.Map;

public class ErrorModel{

    private HttpStatus httpStatus;
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm:SS")
    private LocalDateTime timestamp;

    private String message;

    private Map details;

    public ErrorModel(HttpStatus httpStatus, String message, Map<String, String> details) {
        this.httpStatus = httpStatus;
        this.timestamp = LocalDateTime.now();
        this.message = message;
        this.details = details;
    }

    public HttpStatus getHttpStatus() {
        return httpStatus;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public String getMessage() {
        return message;
    }

    public Map getDetails() {
        return details;
    }
}
