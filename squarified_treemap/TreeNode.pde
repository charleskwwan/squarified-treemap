import java.util.Comparator;

class TreeNode  implements Comparable<TreeNode> {
  float value;
  TreeNode parent;
  ArrayList<TreeNode> children;
  
  TreeNode(float value) {
    this.value = value;
    this.parent = null;
    this.children = new ArrayList<TreeNode>();
  }
  
  @Override
  int compareTo(TreeNode other) {
    if (this.value > other.value) {
      return -1;
    } else if (this.value == other.value) {
      return 0;
    } else {
      return 1;
    }
  }
}