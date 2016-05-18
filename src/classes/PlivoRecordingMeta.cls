public class PlivoRecordingMeta {
    
    public String previous ;

    public Integer total_count ;

    public Integer offset ;

    public Integer limitt ;

    public String next ;

    public PlivoRecordingMeta() {
        // empty
    }

    public override String toString() {
        return 'PlivoRecordingMeta [\n previous=' + previous + ',\n totalCount=' + total_count + ',\n offset=' + offset + ',\n limit=' + limitt + ',\n next=' + next + '\n]';
    }
}