public class CDRMeta {
    public String previous ;
    
    public Integer total_count ;
    
    public Integer offset ;
    
    public Integer limitt ;
    
    public String next ;
    
    public CDRMeta() {
        // empty
    }

	public override String toString() {
		return 'CDRMeta [\n previous=' + previous + ',\n totalCount=' + total_count
				+ ',\n offset=' + offset + ',\n limit=' + limitt + ',\n next=' + next
				+ '\n]';
	}
    
}