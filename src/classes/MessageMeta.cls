public class MessageMeta {
    public String previous ;

    public Integer total_count ;
    
    public Integer offset ;
    
    public Integer limitt ;
    
    public String next ;
    
    public MessageMeta() {
        // empty
    }

	public override String toString() {
		return 'MessageMeta [\n previous=' + previous + ',\n totalCount=' + total_count + ',\n offset=' + offset + ',\n limit=' + limitt + ',\n next=' + next + '\n]';
	}

}