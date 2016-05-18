public class PlivoPreAnswerXML extends PlivoElement {

    public PlivoPreAnswerXML() {
       super(E_PREANSWER, null);
       this.nestableElements = new Set<String>();
       this.nestableElements.add(E_PLAY);
       this.nestableElements.add(E_SPEAK);
       this.nestableElements.add(E_GETDIGITS);
       this.nestableElements.add(E_WAIT);
       this.nestableElements.add(E_REDIRECT);
    }
}