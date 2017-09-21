.class Lcom/google/protobuf/MapEntryLite$Metadata$1;
.super Lcom/google/protobuf/AbstractParser;
.source "MapEntryLite.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/protobuf/MapEntryLite$Metadata;-><init>(Lcom/google/protobuf/MapEntryLite;Lcom/google/protobuf/WireFormat$FieldType;Lcom/google/protobuf/WireFormat$FieldType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/AbstractParser",
        "<",
        "Lcom/google/protobuf/MapEntryLite",
        "<TK;TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/protobuf/MapEntryLite$Metadata;

.field final synthetic val$finalThis:Lcom/google/protobuf/MapEntryLite$Metadata;


# direct methods
.method constructor <init>(Lcom/google/protobuf/MapEntryLite$Metadata;Lcom/google/protobuf/MapEntryLite$Metadata;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/protobuf/MapEntryLite$Metadata;

    .prologue
    .line 58
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Metadata$1;, "Lcom/google/protobuf/MapEntryLite$Metadata$1;"
    iput-object p1, p0, Lcom/google/protobuf/MapEntryLite$Metadata$1;->this$0:Lcom/google/protobuf/MapEntryLite$Metadata;

    iput-object p2, p0, Lcom/google/protobuf/MapEntryLite$Metadata$1;->val$finalThis:Lcom/google/protobuf/MapEntryLite$Metadata;

    invoke-direct {p0}, Lcom/google/protobuf/AbstractParser;-><init>()V

    return-void
.end method


# virtual methods
.method public parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MapEntryLite;
    .locals 3
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/CodedInputStream;",
            "Lcom/google/protobuf/ExtensionRegistryLite;",
            ")",
            "Lcom/google/protobuf/MapEntryLite",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Metadata$1;, "Lcom/google/protobuf/MapEntryLite$Metadata$1;"
    new-instance v0, Lcom/google/protobuf/MapEntryLite;

    iget-object v1, p0, Lcom/google/protobuf/MapEntryLite$Metadata$1;->val$finalThis:Lcom/google/protobuf/MapEntryLite$Metadata;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, p2, v2}, Lcom/google/protobuf/MapEntryLite;-><init>(Lcom/google/protobuf/MapEntryLite$Metadata;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/google/protobuf/MapEntryLite$1;)V

    return-object v0
.end method

.method public bridge synthetic parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Metadata$1;, "Lcom/google/protobuf/MapEntryLite$Metadata$1;"
    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/MapEntryLite$Metadata$1;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MapEntryLite;

    move-result-object v0

    return-object v0
.end method
