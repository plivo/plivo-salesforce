public class PlivoGetDigitsXML extends PlivoElement {

    public PlivoGetDigitsXML() {
      super(E_GETDIGITS, null);
      this.nestableElements = new Set<String>();
      this.nestableElements.add(E_PLAY);
      this.nestableElements.add(E_SPEAK);
      this.nestableElements.add(E_WAIT);
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
     * Sets the integer.
     *
     * @param attr the attr
     * @param int the int
     */
    private void setBoolean(String attr, Boolean bool) {
        String s2 = String.valueOf(bool);
       this.set(attr, s2.toLowerCase());
    }

     /**
     * URL to which the digits entered will be sent
     * @param action
     */
    public void setAction(String actionUrl) {
        this.set('action', actionUrl);
    }

    /**
     * Time in seconds to wait for receiving the first digit.
     * If the user inputs the timeout value, the next element
     * in the response is processed.
     * @param timeout
     */
    public void setTimeout(Integer timeout) {
        this.setInteger('timeout', timeout);
    }

    /**
     * Time in seconds to wait in between two digits entered
     * by the user.
     * @param digitTimeout
     */
    public void setDigitTimeout(Integer digitTimeout) {
        this.setInteger('digitTimeout', digitTimeout);
    }

    /**
     * Submit to 'action' URL using GET or POST
     * @param method
     */
    public void setMethod(String method) {
        this.set('method', method);
    }

    /**
     * Key that triggers the end of caller input
     * @param finishOnKey
     */
    public void setFinishOnKey(String finishOnKey) {
        this.set('finishOnKey', finishOnKey);
    }

    /**
     * How many digits to gather before returning
     * @param numDigits
     */
    public void setNumDigits(Integer numDigits) {
        this.setInteger('numDigits', numDigits);
    }

    /**
     * Number of tries to execute all says and plays one by one
     * @param retries
     */
    public void setRetries(Integer retries) {
        this.setInteger('retries', retries);
    }

    /**
     * Redirect to action URL if true
     * @param redirect
     */
    public void setRedirect(Boolean redirect) {
        this.setBoolean('redirect', redirect);
    }

    /**
     * Play a beep after all plays and says finish
     * @param playBeep
     */
    public void setPlayBeep(Boolean playBeep) {
        this.setBoolean('playBeep', playBeep);
    }

    /**
     * Digits which are allowed to be pressed
     * @param validDigits
     */
    public void setValidDigits(String validDigits) {
        this.set('validDigits', validDigits);
    }

    /**
     * Sound played when invalid digit pressed
     * @param invalidDigitsSound
     */
    public void setInvalidDigitsSound(String invalidDigitsSound) {
        this.set('invalidDigitsSound', invalidDigitsSound);
    }

}