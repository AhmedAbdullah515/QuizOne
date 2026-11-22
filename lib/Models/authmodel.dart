class Authmodel
{
   bool Status;
   String Message;

  Authmodel({required this.Status, required this.Message});
  factory Authmodel.fromJson(Map<String, dynamic> json) 
  {
    return Authmodel
    (
      Status: json['status'],
      Message: json['message'],
    );
  }
}