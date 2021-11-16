## 作业8-遗传算法
### jumpingFrogs
- DNA： 一个由向量数列组成的基因， 包含两种遗传方式函数和一个变异函数
- Frog： 表现型对象，每帧变化位置，即（PVector) location.add(dna.genes[i]); 根据与目标的距离计算适应性；
- population: 一个由Frog对象组成的数组， 进行群组的reproduction， 其中crossover方式为取随机点，前后两段分别取自父母
- population1: 一个由Frog对象组成的数组，与population相似，但crossover时奇数位的基因和偶数位的基因分别来自父母
### main
- 初始化population和population1
- 鼠标点击决定target位置
- 两种不同遗传方法导致两个族群（颜色区分）的表现不同


https://user-images.githubusercontent.com/90953134/141931638-2390dfce-5aaa-49c7-8b4b-4ef08b1440d5.mp4

