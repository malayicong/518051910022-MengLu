class DNA{
  int[] genes;
  
  DNA(){
    /*
    六个基因对应的表现型：
    0-字体；3种
    1-颜色；5种配色方案
    2-大小；random
    3-动态/静态；1-3动态；3-5静态
    4-背景 参数？
    */
    genes = new int[5];
    genes[0] = int(random(1,10));
    genes[1] =int(random(1,10));
    genes[2] = int(random(1,10));
    genes[3] = int(random(1,10));
    genes[4] = int(random(1,10));
  }
 
   DNA(int[] newgenes) {
    genes = newgenes;
  }
  
  DNA crossover(DNA partner) {
    int[] child = new int[genes.length];

    int crossover = int(random(genes.length));
    for (int i = 0; i < genes.length; i++) {
      if (i > crossover) child[i] = genes[i];
      else child[i] = partner.genes[i];
    }    
    DNA newgenes = new DNA(child);
    return newgenes;
  }
    void mutate(float m) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < m) {
        genes[i] = int(random(1,10));
      }
    }
  }
  
}
