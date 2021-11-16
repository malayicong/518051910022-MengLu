class DNA{
  PVector[] genes;
  float maxDistance = 10;

  DNA(){
    genes = new PVector[totalJump];
    for(int i = 0;i<genes.length;i++){
      genes[i] = PVector.random2D();
      genes[i].mult(random(0,maxDistance));
    }
  }
  
  DNA(PVector[] newgenes){
  genes = newgenes;
  }
  
  DNA crossover(DNA partner){
    PVector[] child = new PVector[genes.length];
    int crossover = int(random(genes.length));
    for(int i=0; i<genes.length; i++){
      if(i>crossover) child[i] = genes[i];
      else child[i] = partner.genes[i];
    }
    DNA newgenes = new DNA(child);
    return newgenes;
  }
  DNA crossover_1(DNA partner){
    PVector[] child = new PVector[genes.length];
    for(int i=0;i<genes.length;i++){
    if(i%2 == 0) child[i] = genes[i];
    else child[i] = partner.genes[i];
    }  
    DNA newgenes = new DNA(child);
    return newgenes;
  }
  
  
  void mutate(float m){
    for (int i =0; i<genes.length;i++){
      if(random(1)< m){
        genes[i] = PVector.random2D();
        genes[i].mult(random(0,maxDistance));
      }
    }
  }  

}
