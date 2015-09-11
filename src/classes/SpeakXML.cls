public class SpeakXML extends PlivoElement {

    public SpeakXML(String text) {
       super(E_SPEAK, text);
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
     * Voice to be used based on TTS engine
     * @param voice
     */
    public void setVoice(String voice) {
        this.set('voice', voice);
    }

    /**
     * Language to use
     * @param language
     */
    public void setLanguage(String language) {
        this.set('language', language);
    }

    /**
     * Number of times to say this text
     * @param loop
     */
    public void setLoop(Integer loopVal) {
        this.setInteger('loop', loopVal);
    }

}