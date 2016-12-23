/**
 * 1.package 생성
 * 2.prototype을 이용한메쏘드생성
 */
//var com={};
//com.itwill={};

com.itwill.StudentProto= function(id,name,kor,eng,mat){
		this.id=id;
		this.name=name;
		this.kor=kor;
		this.eng=eng;
		this.mat=mat;
		this.tot=0;
}


   

com.itwill.StudentProto.prototype = {
		toStringJSON:function(){
			return '['+this.id+']'+this.name+''+this.kor+','+this.eng+','+this.mat+','+this.tot;
		},
		calculateTotJSON:function(){
			this.tot=this.kor+this.eng+this.mat;
		},
		getIdJSON:function(){
			return this.id;
		},
		setIdJSON:function(id){
			this.id = id;
		}
};