class Salary_model {
  Salary_model({
      this.result,});

  Salary_model.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result.add(SalResult.fromJson(v));
      });
    }
  }
  List<SalResult> result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class SalResult {
  SalResult({
      this.salaryId, 
      this.empId, 
      this.month, 
      this.salary,});

  SalResult.fromJson(dynamic json) {
    salaryId = json['salary_id'];
    empId = json['emp_id'];
    month = json['month'];
    salary = json['salary'];
  }
  String salaryId;
  String empId;
  String month;
  String salary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['salary_id'] = salaryId;
    map['emp_id'] = empId;
    map['month'] = month;
    map['salary'] = salary;
    return map;
  }

}