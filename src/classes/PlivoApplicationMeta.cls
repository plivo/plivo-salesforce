public class PlivoApplicationMeta {
    public String previous;
    public Integer total_count;
    public Integer offset;
    public Integer limitt;
    public String next;

    public PlivoApplicationMeta() {
            // empty
    }

	public override String toString() {
		return 'PlivoApplicationMeta [previous=' + previous + ', total_count='
				+ total_count + ', offset=' + offset + ', limit=' + limitt
				+ ', next=' + next + ']';
	}
}