public class EndpointMeta {
    public String previous ;

    public Integer total_count ;

    public Integer offset ;
    
    public Integer limitt ;
    
    public String next ;
    
    public EndpointMeta() {
        // empty
    }

	public override String toString() {
		return 'EndpointMeta [previous=' + previous + ', totalCount='
				+ total_count + ', offset=' + offset + ', limit=' + limitt
				+ ', next=' + next + ']';
	}
}