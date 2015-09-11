public class PlivoMessageMeta {
    public String previous ;

    public Integer total_count ;

    public Integer offset ;

    public Integer limitt ;

    public String next ;

    public PlivoMessageMeta() {
        // empty
    }

	public override String toString() {
		return 'PlivoMessageMeta [\n previous=' + previous + ',\n totalCount=' + total_count + ',\n offset=' + offset + ',\n limit=' + limitt + ',\n next=' + next + '\n]';
	}

}