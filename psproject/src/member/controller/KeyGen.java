package member.controller;

import org.apache.commons.codec.binary.Base64;

public class KeyGen {
	
	public static void main(String[] args) {
		
		if (args.length < 1) usage();
		
		String option 	= args[0];
		String text 	= args[1];
		
		if (option.equals("-enc")) {
		
			String encode = Base64.encodeBase64String(text.getBytes());
			System.out.println(encode);
		} else if (option.equals("-dec")) {
			String decode = new String(Base64.decodeBase64(text));
			System.out.println(decode); 
		} else {
			usage();
		}
		
	}
	
    public static void usage()
    {
        System.err.println("usage: java [-classpath] org.gowf.extract.KeyGen [-options]");
        System.err.println("options include:");
        System.err.println("    -enc  <string> : Print encrypted text");
        System.err.println("    -dec  <string> : Print decrypted text");
        
        System.exit(-1);
    }

}
