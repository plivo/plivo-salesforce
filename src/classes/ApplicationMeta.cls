public class ApplicationMeta {
    public String previous;
    public Integer total_count;
    public Integer offset;
    public Integer limitt;
    public String next;
    
    public ApplicationMeta() {
            // empty
    }

	public override String toString() {
		return 'ApplicationMeta [previous=' + previous + ', total_count='
				+ total_count + ', offset=' + offset + ', limit=' + limitt
				+ ', next=' + next + ']';
	}
}