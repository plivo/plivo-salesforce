public class PlivoRecordingList {
    public Integer server_code ;

    public PlivoRecordingMeta meta ;

    public String api_id ;

    public List<PlivoRecording> objects ;

    public String error;

    public PlivoRecordingList() {
        // empty
    }

    public override String toString() {
        return 'PlivoRecordingList [\n serverCode=' + server_code + ',\n meta=' + meta + ',\n apiId=' + api_id + ',\n recordingList=' + objects + ',\n error=' + error + '\n]';
    }
}