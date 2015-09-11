public class PlivoHangupXML extends PlivoElement {

    public PlivoHangupXML() {
       super(E_HANGUP, null);
       this.nestableElements = null;
    }

    /**
     * Give the reason of hangup
     * @param reason
     */
    public void setReason(String reason) {
        this.set('reason', reason);
    }

    /**
     * Set the schedule time, in seconds
     * @param schedule
     */
    public void setSchedule(Integer schedule) {
        String s1 = String.valueOf(schedule);
        this.set('schedule', s1);
    }

}