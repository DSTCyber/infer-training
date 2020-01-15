
DEFINE-CHECKER UNSAFE_SNPRINTF_ACCUMMULATION = {
	//NOTE: This pattern is not perfect :-)
	LET issnprintf = call_function(REGEXP("\\bsnprintf"));
	LET isaccum = is_node("CompoundAssignOperator");
	SET report_when = 
	    issnprintf AND isaccum
	HOLDS-EVENTUALLY;
	SET message = "Possible Unsafe pointer accummulation using snprintf()";
	SET suggestion = "See Reference - TODO";
	SET severity = "ERROR";
};

DEFINE-CHECKER UNSAFE_FUNCTION_USAGE = {
	LET isatoi = call_function(REGEXP("\\batoi"));
	SET report_when = 
	    isatoi;
	SET message = "Unsafe function usage - atoi()";
	SET suggestion = "See Reference - TODO";
	SET severity = "ERROR";
};

DEFINE-CHECKER UNSAFE_FUNCTION_USAGE = {
	LET isstrcpy = call_function(REGEXP("\\bstrcpy"));
	SET report_when = 
	    isstrcpy;
	SET message = "Unsafe function usage - strcpy()";
	SET suggestion = "See Reference - TODO";
	SET severity = "ERROR";
};

