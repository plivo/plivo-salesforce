public class NumberMeta {
    public String previous ;
    
    public Integer total_count ;
    
    public Integer offset ;
    
    public Integer limitt ;
    
    public String next ;
    
    public NumberMeta() {
        // empty
    }

	public override String toString() {
		return 'NumberMeta [previous=' + previous + ', totalCount='
				+ total_count + ', offset=' + offset + ', limit=' + limitt
				+ ', next=' + next + ']';
	}
}