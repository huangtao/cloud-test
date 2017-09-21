.class public final Lcom/google/protobuf/MapEntry;
.super Lcom/google/protobuf/AbstractMessage;
.source "MapEntry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/protobuf/MapEntry$Builder;,
        Lcom/google/protobuf/MapEntry$Metadata;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/protobuf/AbstractMessage;"
    }
.end annotation


# instance fields
.field private final data:Lcom/google/protobuf/MapEntryLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/MapEntryLite",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private final metadata:Lcom/google/protobuf/MapEntry$Metadata;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/MapEntry$Metadata",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/protobuf/Descriptors$Descriptor;Lcom/google/protobuf/WireFormat$FieldType;Ljava/lang/Object;Lcom/google/protobuf/WireFormat$FieldType;Ljava/lang/Object;)V
    .locals 1
    .param p1, "descriptor"    # Lcom/google/protobuf/Descriptors$Descriptor;
    .param p2, "keyType"    # Lcom/google/protobuf/WireFormat$FieldType;
    .param p4, "valueType"    # Lcom/google/protobuf/WireFormat$FieldType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/Descriptors$Descriptor;",
            "Lcom/google/protobuf/WireFormat$FieldType;",
            "TK;",
            "Lcom/google/protobuf/WireFormat$FieldType;",
            "TV;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    .local p3, "defaultKey":Ljava/lang/Object;, "TK;"
    .local p5, "defaultValue":Ljava/lang/Object;, "TV;"
    invoke-direct {p0}, Lcom/google/protobuf/AbstractMessage;-><init>()V

    .line 85
    invoke-static {p2, p3, p4, p5}, Lcom/google/protobuf/MapEntryLite;->newDefaultInstance(Lcom/google/protobuf/WireFormat$FieldType;Ljava/lang/Object;Lcom/google/protobuf/WireFormat$FieldType;Ljava/lang/Object;)Lcom/google/protobuf/MapEntryLite;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/MapEntry;->data:Lcom/google/protobuf/MapEntryLite;

    .line 87
    new-instance v0, Lcom/google/protobuf/MapEntry$Metadata;

    invoke-direct {v0, p1, p0}, Lcom/google/protobuf/MapEntry$Metadata;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;Lcom/google/protobuf/MapEntry;)V

    iput-object v0, p0, Lcom/google/protobuf/MapEntry;->metadata:Lcom/google/protobuf/MapEntry$Metadata;

    .line 88
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/MapEntry$Metadata;Lcom/google/protobuf/MapEntryLite;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/MapEntry$Metadata",
            "<TK;TV;>;",
            "Lcom/google/protobuf/MapEntryLite",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 91
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    .local p1, "metadata":Lcom/google/protobuf/MapEntry$Metadata;, "Lcom/google/protobuf/MapEntry$Metadata<TK;TV;>;"
    .local p2, "data":Lcom/google/protobuf/MapEntryLite;, "Lcom/google/protobuf/MapEntryLite<TK;TV;>;"
    invoke-direct {p0}, Lcom/google/protobuf/AbstractMessage;-><init>()V

    .line 92
    iput-object p1, p0, Lcom/google/protobuf/MapEntry;->metadata:Lcom/google/protobuf/MapEntry$Metadata;

    .line 93
    iput-object p2, p0, Lcom/google/protobuf/MapEntry;->data:Lcom/google/protobuf/MapEntryLite;

    .line 94
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/MapEntry$Metadata;Lcom/google/protobuf/MapEntryLite;Lcom/google/protobuf/MapEntry$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/protobuf/MapEntry$Metadata;
    .param p2, "x1"    # Lcom/google/protobuf/MapEntryLite;
    .param p3, "x2"    # Lcom/google/protobuf/MapEntry$1;

    .prologue
    .line 51
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    invoke-direct {p0, p1, p2}, Lcom/google/protobuf/MapEntry;-><init>(Lcom/google/protobuf/MapEntry$Metadata;Lcom/google/protobuf/MapEntryLite;)V

    return-void
.end method

.method static synthetic access$000(Lcom/google/protobuf/MapEntry;)Lcom/google/protobuf/MapEntryLite;
    .locals 1
    .param p0, "x0"    # Lcom/google/protobuf/MapEntry;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/protobuf/MapEntry;->data:Lcom/google/protobuf/MapEntryLite;

    return-object v0
.end method

.method private checkFieldDescriptor(Lcom/google/protobuf/Descriptors$FieldDescriptor;)V
    .locals 3
    .param p1, "field"    # Lcom/google/protobuf/Descriptors$FieldDescriptor;

    .prologue
    .line 171
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    invoke-virtual {p1}, Lcom/google/protobuf/Descriptors$FieldDescriptor;->getContainingType()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    iget-object v1, p0, Lcom/google/protobuf/MapEntry;->metadata:Lcom/google/protobuf/MapEntry$Metadata;

    iget-object v1, v1, Lcom/google/protobuf/MapEntry$Metadata;->descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    if-eq v0, v1, :cond_0

    .line 172
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Wrong FieldDescriptor \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 173
    invoke-virtual {p1}, Lcom/google/protobuf/Descriptors$FieldDescriptor;->getFullName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" used in message \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/protobuf/MapEntry;->metadata:Lcom/google/protobuf/MapEntry$Metadata;

    iget-object v2, v2, Lcom/google/protobuf/MapEntry$Metadata;->descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    .line 174
    invoke-virtual {v2}, Lcom/google/protobuf/Descriptors$Descriptor;->getFullName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 176
    :cond_0
    return-void
.end method

.method public static newDefaultInstance(Lcom/google/protobuf/Descriptors$Descriptor;Lcom/google/protobuf/WireFormat$FieldType;Ljava/lang/Object;Lcom/google/protobuf/WireFormat$FieldType;Ljava/lang/Object;)Lcom/google/protobuf/MapEntry;
    .locals 6
    .param p0, "descriptor"    # Lcom/google/protobuf/Descriptors$Descriptor;
    .param p1, "keyType"    # Lcom/google/protobuf/WireFormat$FieldType;
    .param p3, "valueType"    # Lcom/google/protobuf/WireFormat$FieldType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/Descriptors$Descriptor;",
            "Lcom/google/protobuf/WireFormat$FieldType;",
            "TK;",
            "Lcom/google/protobuf/WireFormat$FieldType;",
            "TV;)",
            "Lcom/google/protobuf/MapEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 106
    .local p2, "defaultKey":Ljava/lang/Object;, "TK;"
    .local p4, "defaultValue":Ljava/lang/Object;, "TV;"
    new-instance v0, Lcom/google/protobuf/MapEntry;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/protobuf/MapEntry;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;Lcom/google/protobuf/WireFormat$FieldType;Ljava/lang/Object;Lcom/google/protobuf/WireFormat$FieldType;Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public getAllFields()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lcom/google/protobuf/Descriptors$FieldDescriptor;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 160
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 162
    .local v1, "result":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Lcom/google/protobuf/Descriptors$FieldDescriptor;Ljava/lang/Object;>;"
    iget-object v2, p0, Lcom/google/protobuf/MapEntry;->metadata:Lcom/google/protobuf/MapEntry$Metadata;

    iget-object v2, v2, Lcom/google/protobuf/MapEntry$Metadata;->descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    invoke-virtual {v2}, Lcom/google/protobuf/Descriptors$Descriptor;->getFields()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$FieldDescriptor;

    .line 163
    .local v0, "field":Lcom/google/protobuf/Descriptors$FieldDescriptor;
    invoke-virtual {p0, v0}, Lcom/google/protobuf/MapEntry;->hasField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 164
    invoke-virtual {p0, v0}, Lcom/google/protobuf/MapEntry;->getField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 167
    .end local v0    # "field":Lcom/google/protobuf/Descriptors$FieldDescriptor;
    :cond_1
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    return-object v2
.end method

.method public getDefaultInstanceForType()Lcom/google/protobuf/MapEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntry;->metadata:Lcom/google/protobuf/MapEntry$Metadata;

    iget-object v0, v0, Lcom/google/protobuf/MapEntry$Metadata;->defaultInstance:Lcom/google/protobuf/MapEntry;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 51
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntry;->getDefaultInstanceForType()Lcom/google/protobuf/MapEntry;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 51
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntry;->getDefaultInstanceForType()Lcom/google/protobuf/MapEntry;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 155
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntry;->metadata:Lcom/google/protobuf/MapEntry$Metadata;

    iget-object v0, v0, Lcom/google/protobuf/MapEntry$Metadata;->descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    return-object v0
.end method

.method public getField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Ljava/lang/Object;
    .locals 3
    .param p1, "field"    # Lcom/google/protobuf/Descriptors$FieldDescriptor;

    .prologue
    .line 187
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    invoke-direct {p0, p1}, Lcom/google/protobuf/MapEntry;->checkFieldDescriptor(Lcom/google/protobuf/Descriptors$FieldDescriptor;)V

    .line 188
    invoke-virtual {p1}, Lcom/google/protobuf/Descriptors$FieldDescriptor;->getNumber()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    invoke-virtual {p0}, Lcom/google/protobuf/MapEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    .line 190
    .local v0, "result":Ljava/lang/Object;
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/Descriptors$FieldDescriptor;->getType()Lcom/google/protobuf/Descriptors$FieldDescriptor$Type;

    move-result-object v1

    sget-object v2, Lcom/google/protobuf/Descriptors$FieldDescriptor$Type;->ENUM:Lcom/google/protobuf/Descriptors$FieldDescriptor$Type;

    if-ne v1, v2, :cond_0

    .line 191
    invoke-virtual {p1}, Lcom/google/protobuf/Descriptors$FieldDescriptor;->getEnumType()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v1

    check-cast v0, Ljava/lang/Integer;

    .line 192
    .end local v0    # "result":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 191
    invoke-virtual {v1, v2}, Lcom/google/protobuf/Descriptors$EnumDescriptor;->findValueByNumberCreatingIfUnknown(I)Lcom/google/protobuf/Descriptors$EnumValueDescriptor;

    move-result-object v0

    .line 194
    :cond_0
    return-object v0

    .line 188
    :cond_1
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntry;->getValue()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public getKey()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 111
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntry;->data:Lcom/google/protobuf/MapEntryLite;

    invoke-virtual {v0}, Lcom/google/protobuf/MapEntryLite;->getKey()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/google/protobuf/MapEntry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 135
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntry;->metadata:Lcom/google/protobuf/MapEntry$Metadata;

    iget-object v0, v0, Lcom/google/protobuf/MapEntry$Metadata;->parser:Lcom/google/protobuf/AbstractParser;

    return-object v0
.end method

.method public getRepeatedField(Lcom/google/protobuf/Descriptors$FieldDescriptor;I)Ljava/lang/Object;
    .locals 2
    .param p1, "field"    # Lcom/google/protobuf/Descriptors$FieldDescriptor;
    .param p2, "index"    # I

    .prologue
    .line 205
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "There is no repeated field in a map entry message."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getRepeatedFieldCount(Lcom/google/protobuf/Descriptors$FieldDescriptor;)I
    .locals 2
    .param p1, "field"    # Lcom/google/protobuf/Descriptors$FieldDescriptor;

    .prologue
    .line 199
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "There is no repeated field in a map entry message."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSerializedSize()I
    .locals 1

    .prologue
    .line 120
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntry;->data:Lcom/google/protobuf/MapEntryLite;

    invoke-virtual {v0}, Lcom/google/protobuf/MapEntryLite;->getSerializedSize()I

    move-result v0

    return v0
.end method

.method public getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 211
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntry;->data:Lcom/google/protobuf/MapEntryLite;

    invoke-virtual {v0}, Lcom/google/protobuf/MapEntryLite;->getValue()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public hasField(Lcom/google/protobuf/Descriptors$FieldDescriptor;)Z
    .locals 1
    .param p1, "field"    # Lcom/google/protobuf/Descriptors$FieldDescriptor;

    .prologue
    .line 180
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    invoke-direct {p0, p1}, Lcom/google/protobuf/MapEntry;->checkFieldDescriptor(Lcom/google/protobuf/Descriptors$FieldDescriptor;)V

    .line 182
    const/4 v0, 0x1

    return v0
.end method

.method public isInitialized()Z
    .locals 1

    .prologue
    .line 130
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntry;->data:Lcom/google/protobuf/MapEntryLite;

    invoke-virtual {v0}, Lcom/google/protobuf/MapEntryLite;->isInitialized()Z

    move-result v0

    return v0
.end method

.method public newBuilderForType()Lcom/google/protobuf/MapEntry$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapEntry$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 140
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    new-instance v0, Lcom/google/protobuf/MapEntry$Builder;

    iget-object v1, p0, Lcom/google/protobuf/MapEntry;->metadata:Lcom/google/protobuf/MapEntry$Metadata;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/MapEntry$Builder;-><init>(Lcom/google/protobuf/MapEntry$Metadata;Lcom/google/protobuf/MapEntry$1;)V

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 51
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntry;->newBuilderForType()Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 51
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntry;->newBuilderForType()Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/google/protobuf/MapEntry$Builder;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapEntry$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 145
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    new-instance v0, Lcom/google/protobuf/MapEntry$Builder;

    iget-object v1, p0, Lcom/google/protobuf/MapEntry;->metadata:Lcom/google/protobuf/MapEntry$Metadata;

    iget-object v2, p0, Lcom/google/protobuf/MapEntry;->data:Lcom/google/protobuf/MapEntryLite;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/MapEntry$Builder;-><init>(Lcom/google/protobuf/MapEntry$Metadata;Lcom/google/protobuf/MapEntryLite;Lcom/google/protobuf/MapEntry$1;)V

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 51
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntry;->toBuilder()Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 51
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntry;->toBuilder()Lcom/google/protobuf/MapEntry$Builder;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 1
    .param p1, "output"    # Lcom/google/protobuf/CodedOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    .local p0, "this":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntry;->data:Lcom/google/protobuf/MapEntryLite;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/MapEntryLite;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 126
    return-void
.end method
