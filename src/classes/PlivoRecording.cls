public class PlivoRecording {
    public Integer server_code ;

    public String add_time;

    public String call_uuid;

    public String conference_name;

    public String recording_duration_ms;

    public String recording_end_ms;
    
    public String recording_format;
    
    public String recording_id;
    
    public String recording_start_ms;
    
    public String recording_type;
    
    public String recording_url;
    
    public String resource_uri;
    
    public String error;
    
    public String api_id;

    public PlivoRecording() {
        // empty
    }

    public override String toString() {
        return 'PlivoRecording [\n serverCode=' + server_code + ',\n add time=' + add_time
                + ',\n call uuid=' + call_uuid + ',\n conference name =' + conference_name + ',\n recording duration=' + recording_duration_ms + ',\n recording end time='
                + recording_end_ms + '\n recording format=' + recording_format + ',\n recording id=' + recording_id + ',\n recording start time=' + recording_start_ms + ',\n recording type='
                + recording_type + ',\n recording url=' + recording_url + ',\n resource uri=' + resource_uri + ',\n error=' + error + ',\n api id=' + api_id + '\n]';
    }
}