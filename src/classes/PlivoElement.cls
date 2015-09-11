public virtual class PlivoElement {
    protected String tag;

    protected String body;

    protected Map<String, String> attributes;

    protected List<PlivoElement> childTags;

    protected Set<String> nestableElements;

    public static final String E_RESPONSE = 'Response';
    
    public static final String E_CONFERENCE = 'Conference';

    public static final String E_DIAL = 'Dial';
    
    public static final String E_NUMBER = 'Number';
    
    public static final String E_USER = 'User';

    public static final String E_GETDIGITS = 'GetDigits';

    public static final String E_HANGUP = 'Hangup';

    public static final String E_MESSAGE = 'Message';

    public static final String E_PLAY = 'Play';

    public static final String E_PREANSWER = 'PreAnswer';

    public static final String E_RECORD = 'Record';

    public static final String E_REDIRECT = 'Redirect';

    public static final String E_SPEAK = 'Speak';

    public static final String E_WAIT = 'Wait';

    public static final String E_DTMF = 'DTMF';

    /**
     * Instantiates a new verb.
     *
     * @param tag the tag
     * @param body the body
     */
    public PlivoElement(String tag, String body)
      // TODO Auto-generated constructor stub
    {
        this.tag = tag;
        this.body = body;
        this.attributes = new Map<String, String>();
        this.childTags = new List<PlivoElement>();
    }
    
    public PlivoElement append(PlivoElement element) {
       if(this.nestableElements != null && this.nestableElements.contains(element.getTag())) {
           this.childTags.add(element);
           return element;
       } else {
           String error_placeholer = '{0} is not nestable in {1}.';
           String element1 = element.getTag();
           String element2 = this.getTag();
           List<String> error_fillers = new String[]{element1,element2};
           throw new PlivoException(String.format(error_placeholer,error_fillers));
       }
    }
    
    /**
     * To xml.
     *
     * @return the string
     */
    public String toXML(){
        String xml = '<' + this.tag;
        for (String key : attributes.keySet()) {
            xml += ' ' + key + '=\'' + attributes.get(key) + '\'';
        }
        
        if(this.body != null) {
            xml += '>' + this.body + '</' + this.tag + '>';
        } else if(!this.childTags.isEmpty()) {
        	xml += '>';
            for (PlivoElement child : childTags) {
                xml += child.toXML();
            }
            xml += '</' + this.tag + '>';
        } else {
        	xml += '/>';
        }
        return xml;
    }

    /**
     * Sets the attributes for XML element.
     *
     * @param key the key
     * @param value the value
     */
    public void set(String key, String value) {
       attributes.put(key,value);
    }

    /**
     * Gets the body.
     *
     * @return the body
     */
    public String getBody() {
       return this.body;
    }

    /**
     * Gets the tag.
     *
     * @return the tag
     */
    public String getTag() {
       return this.tag;
    }

    /**
     * Gets the children.
     *
     * @return the children
     */
    public List<PlivoElement> getChildren() {
       return this.childTags;
    }

    /**
     * Gets the attributes.
     *
     * @return the attributes
     */
    public Map<String, String> getAttributes() {
       return this.attributes;
    }
}