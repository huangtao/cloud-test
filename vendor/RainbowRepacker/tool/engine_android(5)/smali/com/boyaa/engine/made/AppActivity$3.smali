.class final Lcom/boyaa/engine/made/AppActivity$3;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppActivity;->SetScreenOrientation(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$flag:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .prologue
    .line 146
    iput-boolean p1, p0, Lcom/boyaa/engine/made/AppActivity$3;->val$flag:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 149
    iget-boolean v0, p0, Lcom/boyaa/engine/made/AppActivity$3;->val$flag:Z

    if-ne v1, v0, :cond_0

    .line 151
    # getter for: Lcom/boyaa/engine/made/AppActivity;->mThis:Lcom/boyaa/engine/made/AppActivity;
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->access$100()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/made/AppActivity;->setRequestedOrientation(I)V

    .line 157
    :goto_0
    return-void

    .line 155
    :cond_0
    # getter for: Lcom/boyaa/engine/made/AppActivity;->mThis:Lcom/boyaa/engine/made/AppActivity;
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->access$100()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/made/AppActivity;->setRequestedOrientation(I)V

    goto :goto_0
.end method
