package pension.controller;

public class Util {
	
	public static int getParameterNumber(String str) {
		if(str == null || str.equals("")) {
			return 1;
		} else {
			try {
				return Integer.parseInt(str);
			} catch (NumberFormatException e) {
				return 1;
			}
		}
	}
}
