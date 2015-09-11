public class SubAccountMeta {
    public String previous ;

    public Integer total_count ;
    
    public Integer offset ;
    
    public Integer limitt ;
    
    public String next ;
    
    public SubAccountMeta() {
        // empty
    }

	public override String toString() {
		return 'SubAccountMeta [previous=' + previous + ', totalCount='
				+ total_count + ', offset=' + offset + ', limit=' + limitt
				+ ', next=' + next + ']';
	}
}