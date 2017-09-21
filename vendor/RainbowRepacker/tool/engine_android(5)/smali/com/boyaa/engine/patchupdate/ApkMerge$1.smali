.class Lcom/boyaa/engine/patchupdate/ApkMerge$1;
.super Ljava/lang/Object;
.source "ApkMerge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/patchupdate/ApkMerge;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/patchupdate/ApkMerge;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/patchupdate/ApkMerge;)V
    .locals 0

    .prologue
    .line 126
    iput-object p1, p0, Lcom/boyaa/engine/patchupdate/ApkMerge$1;->this$0:Lcom/boyaa/engine/patchupdate/ApkMerge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 129
    const-string v0, "patchUpdate"

    const-string v1, "result"

    iget-object v2, p0, Lcom/boyaa/engine/patchupdate/ApkMerge$1;->this$0:Lcom/boyaa/engine/patchupdate/ApkMerge;

    # getter for: Lcom/boyaa/engine/patchupdate/ApkMerge;->result:I
    invoke-static {v2}, Lcom/boyaa/engine/patchupdate/ApkMerge;->access$000(Lcom/boyaa/engine/patchupdate/ApkMerge;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 130
    const-string v0, "event_merge_new_apk"

    invoke-static {v0}, Lcom/boyaa/engine/made/Sys;->callLua(Ljava/lang/String;)I

    .line 131
    return-void
.end method
