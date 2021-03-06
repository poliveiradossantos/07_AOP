
public aspect TraceAspectOliveiraDosSantos
{
	pointcut classToTrace(): within(*App);
	
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	before(): methodToTrace()
	{
		String toPrint = "[BGN] " + thisJoinPointStaticPart.getSignature() + ", " //
				+ thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println(toPrint);
	}
		
	after(): methodToTrace()
	{
		String toPrint = "[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName();
		System.out.println(toPrint);
	}
}