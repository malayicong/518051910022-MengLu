class Population1{
  float mutationRate;
  Frog[] population;
  ArrayList<Frog> matingPool;
  int generations;
  
  Population1(float r,int n){
    population = new Frog[n];
    matingPool = new ArrayList<Frog>();
    generations =0;
    for(int i=0;i<n;i++){
      PVector location = new PVector(width/2,height);
      population[i] = new Frog(location, new DNA(),2);
    }
    mutationRate = r;
  }
  
  void fitness(){
  for(int i=0;i<population.length;i++){
      population[i].fitness();
    }
  }
  
  float getMaxFitness(){
    float record = 0;
    for(int i=0;i<population.length;i++){
      if(population[i].getFitness()>record){
        record = population[i].getFitness();
      }
    }
    return record;
  }
  
  void selection(){
    matingPool.clear();
    float maxFitness = getMaxFitness();
   
    for(int i = 0;i<population.length;i++){  
      float fitnessNormal = map(population[i].getFitness(),0,maxFitness,0,1);
      int n=(int)(fitnessNormal *100);
       for(int j =0; j<n;j++){
          matingPool.add(population[i]);
       }
    }
  }
  void reproduction(){
     for (int i = 0; i < population.length; i++) {
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));
      
      Frog mom = matingPool.get(m);
      Frog dad = matingPool.get(d);
   
      DNA momgenes = mom.getDNA();
      DNA dadgenes = dad.getDNA();
     
      DNA child = momgenes.crossover_1(dadgenes);
      
      child.mutate(mutationRate);
      
      PVector location = new PVector(width/2,height+20);
      population[i] = new Frog(location, child,2);
    }
    generations++;
  }

  int getGenerations() {
    return generations;
  }
  
  void live(){
    for(int i=0; i<population.length;i++){
      population[i].jump();
    }
  }

}
