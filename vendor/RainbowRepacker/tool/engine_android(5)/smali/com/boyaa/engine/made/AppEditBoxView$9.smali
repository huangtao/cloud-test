.class Lcom/boyaa/engine/made/AppEditBoxView$9;
.super Ljava/lang/Object;
.source "AppEditBoxView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppEditBoxView;->inputDone()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/made/AppEditBoxView;

.field final synthetic val$returnStr:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppEditBoxView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 504
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEditBoxView$9;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    iput-object p2, p0, Lcom/boyaa/engine/made/AppEditBoxView$9;->val$returnStr:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 507
    const-string v0, "inputDone"

    const-string v1, "onImeClosed"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 508
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$9;->val$returnStr:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/boyaa/engine/made/AppEditBoxView;->onImeClosed([BI)V

    .line 509
    return-void
.end method
