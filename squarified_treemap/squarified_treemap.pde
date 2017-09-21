import java.util.Map;

HashMap<Integer, Float> weights;
HashMap<Integer, ArrayList<Integer>> relations;
ArrayList<Integer> children;
int root;

void setup() {
  selectInput("Select a file to process:", "processFile");

}
 
void processFile(File file) {
   if (file == null) {
     println("No file was selected.");
   } else {
     String[] lines = loadStrings(file.getAbsolutePath());
     int numLeafs = Integer.parseInt(lines[0]);
     
     String[] currLine;
     weights = new HashMap<Integer, Float>();
    
     int i;
     for (i = 1; i <= numLeafs; i++) {
       currLine = lines[i].split(" ");
       weights.put(Integer.parseInt(currLine[0]), Float.parseFloat(currLine[1]));
     }
     
     relations = new HashMap<Integer, ArrayList<Integer>>();
     children = new ArrayList<Integer>();

     int numEdges = Integer.parseInt(lines[numLeafs + 1]);
     
     for (int j = numLeafs + 2; j < numLeafs + 2 + numEdges; j++) {
       currLine = lines[j].split(" ");
       ArrayList<Integer> l = relations.get(Integer.parseInt(currLine[0]));
       if (l == null) {
         l = new ArrayList<Integer>();
       }
       int currChild = Integer.parseInt(currLine[1]);
       children.add(currChild);
       l.add(currChild); 
       relations.put(Integer.parseInt(currLine[0]), l);
     }
    
     //look for root
     for (Map.Entry me : relations.entrySet()) {
         if (!children.contains(me.getKey())) {
           root = (Integer) me.getKey();
         }
      }
   }
   
   Tree tree = new Tree(weights, relations, root);
   tree.printTree(tree);
}