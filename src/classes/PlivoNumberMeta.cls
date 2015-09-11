public class PlivoNumberMeta {
    public String previous ;

    public Integer total_count ;

    public Integer offset ;

    public Integer limitt ;

    public String next ;

    public PlivoNumberMeta() {
        // empty
    }

	public override String toString() {
		return 'PlivoNumberMeta [previous=' + previous + ', totalCount='
				+ total_count + ', offset=' + offset + ', limit=' + limitt
				+ ', next=' + next + ']';
	}
}