abstract class TicketStates{}
 class TicketInitialState extends TicketStates{}
 class TicketGetstates extends TicketStates{}
 class TicketErorrstates extends TicketStates{}
 class TicketLoadingstates extends TicketStates{}



class BookedErorrState extends TicketStates{}
class BookedGetState extends TicketStates{}
class BookedLoadingState extends TicketStates{}



class HandeldErorrState extends TicketStates{}
class HandeldGetState extends TicketStates{}



class SearchingErorrState extends TicketStates{}
class SearchingGetState extends TicketStates{}
class SearchingLoadingState extends TicketStates{}