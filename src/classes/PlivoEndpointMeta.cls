public class PlivoEndpointMeta {
    public String previous ;

    public Integer total_count ;

    public Integer offset ;

    public Integer limitt ;

    public String next ;

    public PlivoEndpointMeta() {
        // empty
    }

	public override String toString() {
		return 'PlivoEndpointMeta [previous=' + previous + ', totalCount='
				+ total_count + ', offset=' + offset + ', limit=' + limitt
				+ ', next=' + next + ']';
	}
}