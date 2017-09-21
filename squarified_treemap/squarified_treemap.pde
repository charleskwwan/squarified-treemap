import java.util.Map;

TreeNode root;

void setup() {
  selectInput("Select a file to process:", "treeFromFile");
  normalize(root, sumNodeWeight(root));
}

void draw() {
}

// create tree from file data
void treeFromFile(File file) {
  if (file == null) {
    println("No file was selected.");
  } else {
    String[] lines = loadStrings(file.getAbsolutePath());
    int numLeaves = Integer.parseInt(lines[0]);
    HashMap<Integer, TreeNode> nodes = new HashMap<Integer, TreeNode>();
    
    for (int i = 1; i <= numLeaves; i++) {
      String[] currLine = lines[i].split(" ")
      nodes.put(Integer.parseInt(currLine[0]), new TreeNode(Float.parseFloat(currLine[1])));
    }
    
    int numEdges = Integer.parseInt(lines[numLeaves + 1]);
    for (int i = numLeaves + 2; i < numLeaves + 2 + numEdges; i++) {
      String[] currLine = lines[i].split(" ");
      int parentID = Integer.parseInt(currLine[0]);
      int childID = Integer.parseInt(currLine[1]);
      TreeNode parent, child;
      
      if (!nodes.containsKey(parentID)) {
        parent = new TreeNode(0);
        nodes.put(parentID, parent);
      } else {
        parent = nodes.get(parentID);
      }
      if (!nodes.containsKey(childID)) {
        child = new TreeNode(0);
        nodes.put(childID, child);
      } else {
        child = nodes.get(childID);
      }
      
      child.parent = parent;
      parent.children.add(child);
    }
    
    // look for root
    for (TreeNode node : nodes.values()) {
      if (node.parent == null) {
        root = node;
        break;
      }
    }
  }
}

// sums the total weight of a tree - weight of node + all children
// side effect: node's weight is assigned to sum of all children's
float sumNodeWeight(TreeNode node) {
  float sum = node.value;
  for (TreeNode c : node.children) {
    sum += sumNodeWeight(c);
  }
  node.value = sum;
  return sum;
}

// convert all weights in tree to ratios
void normalize(TreeNode node, float normfact) {
  node.value /= normfact;
  for (TreeNode c : node.children) {
    normalize(c, normfact);
  }
}