public class PlivoDialNumberXML extends PlivoElement {

    public PlivoDialNumberXML(String dialnumber) {
       super(E_NUMBER, dialnumber);
       this.nestableElements = null;
    }

    /**
     * Sets the boolean.
     *
     * @param attr the attr
     * @param bool the bool
     */
    private void setBoolean(String attr, Boolean bool) {
        String s1 = String.valueOf(bool);
       this.set(attr, s1.toLowerCase());
    }

    /**
     * specify if you need inband (default = rfc2833)
     * @param sendDigitsMode
     */
    public void setSendDigitsMode(String sendDigitsMode) {
        this.set('sendDigitsMode', sendDigitsMode);
    }

    /**
     * Key to press after connecting to the number
     * @param sendDigits
     */
    public void setSendDigits(String sendDigits) {
        this.set('sendDigits', sendDigits);
    }

    /**
     * If the digits need to be sent during
    * early media.
     * @param sendOnPreanswer
     */
    public void setSendOnPreanswer(Boolean sendOnPreanswer) {
        this.setBoolean('sendOnPreanswer', sendOnPreanswer);
    }

 }