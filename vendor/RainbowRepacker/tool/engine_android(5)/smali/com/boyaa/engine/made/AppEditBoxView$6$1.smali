.class Lcom/boyaa/engine/made/AppEditBoxView$6$1;
.super Ljava/lang/Object;
.source "AppEditBoxView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppEditBoxView$6;->onGlobalLayout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/engine/made/AppEditBoxView$6;

.field final synthetic val$screenHeight:I

.field final synthetic val$screenWidth:I


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppEditBoxView$6;II)V
    .locals 0

    .prologue
    .line 317
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEditBoxView$6$1;->this$1:Lcom/boyaa/engine/made/AppEditBoxView$6;

    iput p2, p0, Lcom/boyaa/engine/made/AppEditBoxView$6$1;->val$screenHeight:I

    iput p3, p0, Lcom/boyaa/engine/made/AppEditBoxView$6$1;->val$screenWidth:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 320
    const/4 v0, 0x0

    iget v1, p0, Lcom/boyaa/engine/made/AppEditBoxView$6$1;->val$screenHeight:I

    iget-object v2, p0, Lcom/boyaa/engine/made/AppEditBoxView$6$1;->this$1:Lcom/boyaa/engine/made/AppEditBoxView$6;

    iget-object v2, v2, Lcom/boyaa/engine/made/AppEditBoxView$6;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->keyboardHeight:I
    invoke-static {v2}, Lcom/boyaa/engine/made/AppEditBoxView;->access$800(Lcom/boyaa/engine/made/AppEditBoxView;)I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/boyaa/engine/made/AppEditBoxView$6$1;->val$screenWidth:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/boyaa/engine/made/AppEditBoxView$6$1;->this$1:Lcom/boyaa/engine/made/AppEditBoxView$6;

    iget-object v3, v3, Lcom/boyaa/engine/made/AppEditBoxView$6;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->keyboardHeight:I
    invoke-static {v3}, Lcom/boyaa/engine/made/AppEditBoxView;->access$800(Lcom/boyaa/engine/made/AppEditBoxView;)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v0, v1, v2, v3}, Lcom/boyaa/engine/made/AppEditBoxView;->onImeOpened(FFFF)V

    .line 321
    return-void
.end method
