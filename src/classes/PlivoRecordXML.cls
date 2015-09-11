public class PlivoRecordXML extends PlivoElement {

    public PlivoRecordXML() {
       super(E_RECORD, null);
       this.nestableElements = null;
    }

    /**
     * Sets the integer.
     *
     * @param attr the attr
     * @param intr the intr
     */
    private void setInteger(String attr, Integer intr) {
        String s1 = String.valueOf(intr);
       this.set(attr, s1);
    }

    /**
     * Sets the boolean.
     *
     * @param attr the attr
     * @param bool the bool
     */
    private void setBoolean(String attr, Boolean bool) {
        String s2 = String.valueOf(bool);
       this.set(attr, s2.toLowerCase());
    }

    /**
     * Maximum number of seconds to record (default 60)
     * @param maxLength
     */
    public void setMaxLength(Integer maxLength) {
        this.setInteger('maxLength', maxLength);
    }

    /**
     * Submit the result of the record to this URL
     * @param action
     */
    public void setAction(String actionUrl) {
        this.set('action', actionUrl);
    }

    /**
     * Seconds of silence before considering the recording complete (default 1440)
     * @param timeout
     */
    public void setTimeout(Integer timeout) {
        this.setInteger('timeout', timeout);
    }

    /**
     * Submit to 'action' URL using GET or POST
     * @param method
     */
    public void setMethod(String method) {
        this.set('method', method);
    }

    /**
     * Stop recording on this key
     * @param finishOnKey
     */
    public void setFinishOnKey(String finishOnKey) {
        this.set('finishOnKey', finishOnKey);
    }

    /**
     * Play a beep before recording (true/false, default true)
     * @param playBeep
     */
    public void setPlayBeep(Boolean playBeep) {
        this.setBoolean('playBeep', playBeep);
    }

    /**
     * Redirect to action url or not (true/false, default false)
     * @param redirect
     */
    public void setRedirect(Boolean redirect) {
        this.setBoolean('redirect', redirect);
    }

    /**
     * Record call when called party answers in a Dial
     * (true/false, default false). No beep will be played.
     * @param startOnDialAnswer
     */
    public void setStartOnDialAnswer(Boolean startOnDialAnswer) {
        this.setBoolean('startOnDialAnswer', startOnDialAnswer);
    }

    /**
     * Record current call session in background
     * (true/false, default false). No beep will be played.
     * @param recordSession
     */
    public void setRecordSession(Boolean recordSession) {
        this.setBoolean('recordSession', recordSession);
    }

    public void setTranscriptionType(String transcriptionType){
        this.set('transcriptionType', transcriptionType);
    }

    public void setTranscriptionUrl(String transcriptionUrl){
        this.set('transcriptionUrl', transcriptionUrl);
    }

    public void setTranscriptionMethod(String transcriptionMethod){
        this.set('transcriptionMethod', transcriptionMethod);
    }

    public void setCallbackUrl(String callbackUrl){
        this.set('callbackUrl', callbackUrl);
    }

    public void setCallbackMethod(String callbackMethod){
        this.set('callbackMethod', callbackMethod);
    }

}