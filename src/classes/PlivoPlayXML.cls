public class PlivoPlayXML extends PlivoElement {

   public PlivoPlayXML(String uri) {
       /**
        * Instantiates a new play object.
        *
        * @param uri
        */
      super(E_PLAY, uri);
        this.nestableElements = null;
    }

    /**
     * Number of time to say this text
     * @param loop
     */
    public void setLoop(Integer loopVal) {
        String s1 = String.valueOf(loopVal);
        this.set('loop', s1);
    }

}