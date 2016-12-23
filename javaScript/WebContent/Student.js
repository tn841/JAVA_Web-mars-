/**
 * 
 */
var com={};
com.itwill={};
com.itwill.Student = function(id,name,kor,eng,mat){
		this.id=id;
		this.name=name;
		this.kor=kor;
		this.eng=eng;
		this.mat=mat;
		this.tot=0;
		this.calculateTot=function(){
			this.tot=this.kor+this.eng+this.mat;
		};
		this.toString=function(){
			return '['+this.id+']'+this.name+''+this.kor+','+this.eng+','+this.mat+','+this.tot;
		};
}