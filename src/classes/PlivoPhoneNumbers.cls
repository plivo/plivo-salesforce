public class PlivoPhoneNumbers {
	public PlivoLocalNumberRental local ;

	public PlivoTollFreeNumberRental tollfree ;
	
	public PlivoPhoneNumbers() {
		// TODO Auto-generated constructor stub
	}

	public override String toString() {
		return 'PlivoPhoneNumbers [\n localMonthlyRental=' + local
				+ ',\n tollfreeMonthlyRental=' + tollfree + '\n]';
	}
}